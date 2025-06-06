import { dlopen, FFIType, suffix } from "bun:ffi";

const pathMyMath = `./libc/libmymath.${suffix}`;

const libMyMath = dlopen(pathMyMath, {
    add: {
        args: [FFIType.i32, FFIType.i32], // Usar FFIType.i32 para mayor claridad
        returns: FFIType.i32,
    },
});

export function add(a: number, b: number): number {
    if (!libMyMath.symbols.add) {
        throw new Error("source library not loaded or function not found");
    }
    return libMyMath.symbols.add(a, b);
}