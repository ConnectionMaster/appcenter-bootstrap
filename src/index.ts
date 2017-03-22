import { Greeter } from "./greeter";

function makeGreeter() {
    return new Greeter("David");
}
console.log(makeGreeter().greet());
