import { echoBytes, echoString } from "./echo";
import { add } from "./mymath";




let result: number = add(10, 20);

console.log(`The result of adding 10 and 20 is: ${result}`); 


let str: string= echoString("Hello, Bun FFI!");


console.log(`The echoed string is: ${str}`);



let bytes: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);


let echoedBytes: Uint8Array = echoBytes(bytes);


console.log(`The echoed bytes are: ${Array.from(echoedBytes).join(", ")}`);