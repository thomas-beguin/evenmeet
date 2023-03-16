const fetchWithToken = (url, options = {}) => {
  options.headers = {
    "X-CSRF-Token": csrfToken(),
    ...options.headers
  };

  return fetch(url, options)
}

const csrfToken = () => {
  return document.querySelector('[name="csrf-token"]').content
}

function showElements() {
  Array.from(arguments).flat().forEach((e) => {
    e.classList.remove('hidden')
  })
}

function hideElements() {
  Array.from(arguments).flat().forEach((e) => {
    e.classList.add('hidden')
  })
}

function fadeShowElements() {
  Array.from(arguments).flat().forEach((e) => {
    e.classList.add('quick-fade-in') // 250ms
    e.classList.remove('quick-fade-out', 'hidden') // 250ms
    setTimeout(() => {
      e.classList.remove('quick-fade-in') // 250ms
    }, 500)
  })
}

function fadeHideElements() {
  Array.from(arguments).flat().forEach((e) => {
    e.classList.remove('quick-fade-in') // 250ms
    e.classList.add('quick-fade-out') // 250ms
    setTimeout(() => {
      e.classList.add('hidden')
      e.classList.remove('quick-fade-out') // 250ms
    }, 500)
  })
}

function toggleElements() {
  Array.from(arguments).flat().forEach((e) => {
    e.classList.toggle('hidden')
  })
}

global.csrfToken        = csrfToken
global.fetchWithToken   = fetchWithToken
global.showElements     = showElements
global.hideElements     = hideElements
global.fadeShowElements = fadeShowElements
global.fadeHideElements = fadeHideElements
global.toggleElements   = toggleElements
