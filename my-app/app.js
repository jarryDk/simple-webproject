import { html, render } from "./lit-html.js";

class WebHello extends HTMLElement { 

    constructor() { 
        super();
        this.message = 'Hello from web';
    }

    connectedCallback() { 
        render(this.render(), this);
    }

    render() { 
        return html`
            <h3>${this.message}</h3>
        `;
    }

}

customElements.define('web-hello',WebHello);