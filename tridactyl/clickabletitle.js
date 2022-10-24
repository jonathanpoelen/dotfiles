// command clickabletitle js
for (const elem of document.querySelectorAll('h1,h2,h3,h4,h5,h6'))
{
  const id = elem.id || elem.querySelector('[id]')?.id || elem.previousElementSibling?.id;
  if (id)
  {
    const a = document.createElement('a');
    a.textContent = '¶';
    a.href = '#'+id;
    elem.prepend(a)
  }
}
