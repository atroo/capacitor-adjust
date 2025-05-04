import { Adjust } from '@sgdb/capacitor-adjust';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    Adjust.echo({ value: inputValue })
}
