export class Modal {
  constructor(options = {}) {
    this.element = document.querySelector('#astro-modal')
    this.backdrop = this.element.querySelector('.astro-modal-backdrop')
    this.body = this.element.querySelector('.astro-modal-body')
    this.content = this.element.querySelector('.astro-modal-content')
    this.closeBtn = this.element.querySelector('.close-button')
    this.init()
  }

  init() {
    this.body = document.querySelector('body')
    this.html = document.querySelector('html')
    this.bodyOverflowValue = this.body.style.overflow || 'auto'
    this.htmlOverflowValue = this.html.style.overflow || 'auto'
    this.element.modal = this
    window.modal = this
    this.backdrop.addEventListener('click', this.hideFromBackdrop.bind(this))
    this.closeBtn.addEventListener('click', this.close.bind(this))
    console.log("modal init")
  }

  open() {
    fadeShowElements(this.element)
    this.body.style.overflow = 'hidden'
    this.html.style.overflow = 'hidden'
  }

  close() {
    this.body.style.overflow = this.bodyOverflowValue
    this.html.style.overflow = this.htmlOverflowValue
    fadeHideElements(this.element)
    setTimeout(this.#emptyContent.bind(this), 500)
  }

  hideFromBackdrop(event) {
    if (event.currentTarget == event.srcElement) this.close()
  }

  replaceContent(attr = {}) {
    if (attr.html) this.#replaceContentHTML(attr.html)
    if (attr.url) {
      fetchWithToken(attr.url)
        .then(response => response.json())
        .then((data) => {
          this.content.classList.add('quick-fade-out-in')

          setTimeout(() => { this.#replaceContentHTML(data.html) }, 125)
          setTimeout(() => { this.content.classList.remove('quick-fade-out-in') }, 250)
        })
    }
  }

  #replaceContentHTML(html) {
    this.content.innerHTML = html
  }

  #emptyContent() {
    const solarSystem = `<section class="solar_system_sm">
                          <div class="sun"></div>
                          <article class="mercury-trajectory">
                            <div class="planet mercury"></div>
                          </article>
                          <article class="venus-trajectory">
                            <div class="planet venus"></div>
                          </article>
                          <article class="earth-trajectory">
                            <div class="planet earth"></div>
                          </article>
                          <article class="mars-trajectory">
                            <div class="planet mars"></div>
                          </article>
                        </section>`
    this.replaceContent({html: solarSystem})
  }
}
