import { dlopen, FFIType, suffix } from "bun:ffi";


const pathMyMath = `./libc/libmymath.${suffix}`;

const libMyMath = dlopen(pathMyMath, {
    add: {
        args: [FFIType.int, FFIType.int],
        returns: FFIType.int,
    },
});

const result = libMyMath.symbols.add(10, 20);



console.log(`The result of adding 10 and 20 is: ${result}`); // Should print: The result of adding 10 and 20 is: 30