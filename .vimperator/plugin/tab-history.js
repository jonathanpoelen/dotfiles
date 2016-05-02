var INFO = xml`
<plugin name="TabHistory"
        version="0.1"
        href=""
        summary="Go back/forward the tab selection history"
        xmlns="http://vimperator.org/namespaces/liberator">
  <author email="teramako@gmail.com">teramako</author>
  <author email="jonathan.poelen+vimperator@gmail.com">jonathan poelen</author>
  <license>MPL 1.1/GPL 2.0/LGPL 2.1</license>
  <project name="Vimperator" minVerion="3.1"/>
  <item>
    <tags>:tabhistory :tabh</tags>
    <spec>:tabh<oa>istory</oa></spec>
    <description><p>Show the selection history</p></description>
  </item>
  <item>
    <tags>:tabhistory :tabh</tags>
    <spec>:tabh<oa>istory</oa> <a>index</a></spec>
    <description><p>Go to history tab index</p></description>
  </item>
  <item>
    <spec>:tabh<oa>istory</oa> back</spec>
    <description><p>Go back the history</p></description>
  </item>
  <item>
    <spec>:tabh<oa>istory</oa> forward</spec>
    <description><p>Go forward the history</p></description>
  </item>
  <item>
    <spec>:tabh<oa>istory</oa> swap</spec>
    <description><p>Go last selected tab</p></description>
  </item>
  <item> 
    <spec>:tabh<oa>istory</oa> clear</spec>
    <description><p>Clear the history</p></description>
  </item>
</plugin>`;

var tabHistory = (function(){
  const mTabContainer = window.gBrowser.mTabContainer,
        DISCONNECTED = Element.prototype.DOCUMENT_POSITION_DISCONNECTED;

  var history = [mTabContainer.selectedItem],
      index = 0,
      maxItems = 20,
      dontHandle = false;

  var isDisconnected = function (aTab) {
    return !!(mTabContainer.compareDocumentPosition(aTab) & DISCONNECTED);
  }

  var onTabSelect = function (aEvent) {
    if (dontHandle)
      dontHandle = false;
    else
      addHistory(aEvent.target);
  }

  var onTabClose = function (aEvent) {
    let aTab = aEvent.target, i;
    while ((i = history.indexOf(aTab)) !== -1) {
      history.splice(i, 1);
      if (i <= index)
        --index;
    }

    for (let i = 1; i < history.length; ++i) {
      let prevTab = history[i - 1],
          currentTab = history[i];

      if (prevTab === currentTab) {
        history.splice(i--, 1);
        if (i <= index)
          --index;
      }
    }
  }

  var addHistory = function (aTab) {
    if (aTab === history[index])
      return;

    var i = index + 1;

    history.splice(i, history.length - i, aTab);
    if (maxItems > 0 && history.length > maxItems)
      history.splice(0, history.length - maxItems);

    index = history.length - 1;
  }

  var select = function (aTab) {
    if (aTab === mTabContainer.selectedItem)
      return;

    dontHandle = true;
    mTabContainer.selectedItem = aTab;
  }
  
  var TH = {
    get canGoBack() index > 0,
    get canGoForward() index < history.length - 1,
    goBack: function () {
      if (!this.canGoBack)
        return;

      var tab = history[--index];
      if (isDisconnected(tab)) {
        history.splice(index, 1);
        this.goBack();
      } else
        select(tab);
    },
    goForward: function () {
      if (!this.canGoForward)
        return;

      var tab = history[++index];
      if (isDisconnected(tab)) {
        history.splice(index, 1);
        this.goForward();
      } else
        select(tab);
    },
    goLastSelected: function () {
      if (this.canGoForward)
        this.goForward();
      else
        this.goBack();
    },
    go: function (idx) {
      if (idx < history.length - index || idx > -index) {
        var tab = history[index+idx];
        if (isDisconnected(tab)) {
          history.splice(index+idx);
          this.go(idx);
        } else {
          index += idx;
          select(tab);
        }
      } else
        throw TypeError('invalid index');
    },
    clear: function () {
      history = [mTabContainer.selectedItem];
      index = 0;
    },
    set maxItemCount (val) {
      val = Number(val);
      if (isNaN(val))
        throw TypeError('must be Number');

      if (val > 0)
        return maxItems = val;
      else
        return maxItems = -1;
    },
    get maxItemCount () {
      return maxItems;
    }
  };

  mTabContainer.addEventListener('TabSelect', onTabSelect, false);
  mTabContainer.addEventListener('TabClose', onTabClose, false);

  commands.addUserCommand(['tabh[istory]'], 'Tab Selection History',
    function tabSelectionHistoryAction (args) {
      switch (args[0]) {
      case 'back':
        TH.goBack();
        break;
      case 'forward':
        TH.goForward();
        break;
      case 'swap':
        TH.goLastSelected();
        break;
      case 'clear':
        TH.clear();
        break;
      default:
        if (args[0] !== undefined) {
          TH.go(Number(args[0]));
        }
        else {
          let xml = template.table('TabHistory', history.map((tab, i) => [i - tabhistory.index, tab.label]));
          liberator.echo(xml);
        }
      }
    }, {
      completer: function TH_completer (context) {
        var list = history.filter((_, i) => i !== index).map((tab, i) => [i - index, tab.label]);

	list.push(['clear', 'Clear']);

	if (TH.canGoForward)
          list.push(['forward', 'Forward to `' + history[index + 1].label + '"']);

        if (TH.canGoBack)
          list.push(['back', 'Back to "' + history[index - 1].label + '"']);

        if (TH.canGoForward || TH.canGoBack)
          list.push(['swap', 'Last selected tab ("' + history[index - 1].label + '")']);

	context.title = ['TabSelectionHistory', 'SubCmd'];
        context.compare = null;
        context.completions = list.reverse();
      },
    }, true);


  __context__.onUnload = function onUnload () {
    mTabContainer.removeEventListener('TabSelecte', onTabSelect, false);
    mTabContainer.removeEventListener('TabClose', onTabClose, false);
  };

  return TH;
})();
