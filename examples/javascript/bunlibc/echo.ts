import { CString, dlopen, FFIType, ptr, suffix } from "bun:ffi";



const pathecho = `./libc/libecho.${suffix}`;

const libecho = dlopen(pathecho, {
    EchoString: {
        args: [FFIType.cstring], // 
        returns: FFIType.cstring,
    },
});




// Function to echo a string using the C library
export function echoString(str: string): string {
  // Check if the EchoString function is available
  if (!libecho.symbols.EchoString) {
    throw new Error('source library not loaded or function not found');
  }

    // Convert the JavaScript string to buffer 
  const buff = Buffer.from(str, 'utf8');

    // Create a CString from the buffer 
    // this not works but to my eyes should work
   // const cstr = new CString(ptr(buff), buff.length);
 
  // Call the C function with the buffer because with the cstr did not work
  const result = libecho.symbols.EchoString(buff);

  // Convert result (CString) to JS string
  return result.toString();
}