import { echoString } from "./echo";
import { add } from "./mymath";




let result: number = add(10, 20);

console.log(`The result of adding 10 and 20 is: ${result}`); 


let str: string= echoString("Hello, Bun FFI!");


console.log(`The echoed string is: ${str}`);