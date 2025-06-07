import { CString, dlopen, FFIType, ptr, suffix } from "bun:ffi";



const pathecho = `./libc/libecho.${suffix}`;

const libecho = dlopen(pathecho, {
    EchoString: {
        args: [FFIType.cstring], // 
        returns: FFIType.cstring,
    },
    EchoBytes: {
        args: [FFIType.ptr, FFIType.int, FFIType.ptr], // input_ptr, input_size, output_size_ptr
        returns: FFIType.ptr, // Retorna el puntero al resultado
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

export function echoBytes(bytes: Uint8Array): Uint8Array {
  // Check if the EchoString function is available
  if (!libecho.symbols.EchoBytes) {
    throw new Error('source library not loaded or function not found');
  }
// Prepare input buffer
    const inputBuffer = Buffer.from(bytes);
    const inputPtr = ptr(inputBuffer);
    
    // Create buffer for output size (int32)
    const outputSizeBuffer = new ArrayBuffer(4);
    const outputSizePtr = ptr(outputSizeBuffer);
    
    // Call the C function
    const resultPtr = libecho.symbols.EchoBytes(inputPtr, bytes.length, outputSizePtr);
    
    // Read output size
    const outputSize = new DataView(outputSizeBuffer).getInt32(0, true);
    
    // Convert result pointer to Uint8Array
    const resultBuffer = new Uint8Array(outputSize);
    // Copy memory from C pointer to our buffer
    const sourceView = new Uint8Array(new ArrayBuffer(outputSize));
    for (let i = 0; i < outputSize; i++) {
        sourceView[i] = new DataView(new ArrayBuffer(1)).getUint8(0);
    }
    resultBuffer.set(sourceView);
    
    // Create final result
    const finalResult = new Uint8Array(resultBuffer);
    
    // Note: You might need to free the resultPtr if the C function allocates memory
    // If the C function requires freeing the returned pointer, uncomment this:
    // Bun.free(resultPtr);
    
    return finalResult;
}