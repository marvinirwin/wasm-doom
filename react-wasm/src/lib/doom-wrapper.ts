import DOOM from '../wasm/wasm-doom';
import {buffer, filter, map} from "rxjs/operators";
import {Subject} from "rxjs";

const stdOut$: Subject<number> = new Subject();
const stdErr$: Subject<number> = new Subject();
const stdOutFinished$ = stdOut$.pipe(filter(a => a === 10));
const stdErrFinished$ = stdErr$.pipe(filter(a => a === 10));
export const bufferedStdOut$ = stdOut$.pipe(buffer(stdOutFinished$), map(byteArray => {
    const v = byteArray.map(c => String.fromCharCode(c)).join('');
    return v;
}));
export const bufferedStdErr$ = stdErr$.pipe(buffer(stdErrFinished$), map(byteArray => {
    const v = byteArray.map(c => String.fromCharCode(c)).join('');
    return v;
}));

bufferedStdOut$.subscribe(v => console.log(v));
bufferedStdErr$.subscribe(v => console.warn(v));

export function bytesToBase64(b: Uint8Array): Promise<string> {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.addEventListener("load", function () {
            const base64gif = reader.result; // your gif in base64 here
            // @ts-ignore
            resolve(base64gif);
        }, false);
        // It's weird how I have to have an array of arrays of bytes,
        // but the parameter is blobParts so I guess its accounting for parts not the whole
        const blob = new Blob([b], {type: "image/gif"});
        reader.readAsDataURL(blob);
    });
}

export async function run() {
    let wasmInstance;
    const Module = {};
    // @ts-ignore
    Module.stderr = v => stdErr$.next(v);
    // Module.stdin = stdin(e.encode(`-i ${inFilename} --rotate-90 > ${outfilename}`));
    // @ts-ignore
    Module.arguments = [
        'doom1.wad'
    ];
    // ["-i", inFilename, /*'--resize', '300x300',*/ "-o", outfilename];
    const resp = await (await fetch('/doom1.wad')).arrayBuffer();
    const a = new Uint8Array(resp);
    // @ts-ignore
    Module.MEMFS = [{name: 'doom1.wad', data: a}];
    // @ts-ignore
    Module.render = (buffer, bytePointer, length) => {
        let width = 320;
        let height = 200;
        const canvas = document.createElement('canvas');
        canvas.width = width;
        canvas.height = height;
        document.body.appendChild(canvas);
        setInterval(() => {
            let screenBytes = new Uint8ClampedArray(buffer, bytePointer, length);
            const ctx = canvas.getContext('2d');
            if (ctx) {
                const imageData = ctx.createImageData(width, height);
                imageData.data.set(screenBytes);
                ctx.putImageData(imageData, 0, 0);
                console.log('finished rendering DOM');
            }
            // Oh yeah I have no idea how to write bytes from javascript to wasm
            // Probably that wasmMemory thing
        }, 500);
    };
    interface event {
        type: number;
        data1: number;
        data2: number | undefined;
        data3: number | undefined;
    }

    // @ts-ignore
    Module.eventLoop = (
        p_type: number,
        p_data1: number,
        p_data2: number,
        p_data3: number,
        p_consumed: number,
        setValue: (n: number, n2: number) => number,
        getValue: (n: number, n2: string) => number) => {
        const eventQue: event[] = [];
        setInterval(() => {
            if (!eventQue.length) return;
            // I suppose I should have access to the wasm memory object which uses getvalue
            const eventFree = getValue(Number(p_consumed), 'i8');
            if (!eventFree) return;

            const ev: event | undefined = eventQue.shift();
            if (!ev) return;
            const {type, data3, data2, data1} = ev;
            setValue(p_type, type);
            setValue(p_data1, data1);
            setValue(p_data2, data2 || 0);
            setValue(p_data3, data3 || 0);
            setValue(p_consumed, 1);
        }, 100);
        window.onkeydown = ((e: KeyboardEvent) => {
            debugger;
            let items = {
                // I assume 1 is ev_keydown
                type: 1,
                // Will this be an integer?
                data1: parseInt(e.charCode, 10),
                data2: undefined,
                data3: undefined
            };
            eventQue.push(items);
        });
        window.onkeyup = ((e: KeyboardEvent) => {
            let items = {
                // I assume 2 is ev_keydown
                type: 2,
                // Will this be an integer?
                data1: parseInt(e.charCode, 10),
                data2: undefined,
                data3: undefined
            };
            eventQue.push(items);
        });
    };

    const execution = DOOM(Module);
}





