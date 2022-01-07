window.addEventListener('DOMContentLoaded', () => {
  const checkbox = document.querySelector('.recipe-show-toggle-public')

  checkbox.addEventListener('click', () => {
    const form = document.querySelector('form')
    form.submit()
  })
})