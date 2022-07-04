if (tri.ext_mouseover_links)
{
  for(const elem of tri.ext_mouseover_links)
  {
    elem.style.outline='';
    tri.browserBg.tabs.create({url:elem.href, active:false});
  }
  tri.ext_mouseover_links = undefined;
}
else
{
  tri.ext_mouseover_links = new Set();
  document.onmouseover = (e) => {
    let elem = e.target;
    for (let i=0; i<5; ++i)
    {
      if (elem.tagName === 'A')
      {
        elem.style.outline = '1px solid red';
        tri.ext_mouseover_links.add(elem);
        return;
      }
      elem = elem.parentNode;
    }
  }
}
