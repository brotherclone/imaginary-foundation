tinymce.PluginManager.add("textpattern",function(e){function t(){return c&&(l.sort(function(e,t){return e.start.length>t.start.length?-1:e.start.length<t.start.length?1:0}),c=!1),l}function n(e){for(var n=t(),i=0;i<n.length;i++)if(0===e.indexOf(n[i].start)&&(!n[i].end||e.lastIndexOf(n[i].end)==e.length-n[i].end.length))return n[i]}function i(e,n,i){var r,o,a;for(r=t(),a=0;a<r.length;a++)if(o=r[a],o.end&&e.substr(n-o.end.length-i,o.end.length)==o.end)return o}function r(t){function r(){l=l.splitText(u),l.splitText(c-u-p),l.deleteData(0,h.start.length),l.deleteData(l.data.length-h.end.length,h.end.length)}var o,a,s,l,c,u,d,f,h,p,m;if(o=e.selection,a=e.dom,o.isCollapsed()&&(s=o.getRng(!0),l=s.startContainer,c=s.startOffset,d=l.data,p=t?1:0,3==l.nodeType&&(h=i(d,c,p),h&&(u=Math.max(0,c-p),u=d.lastIndexOf(h.start,u-h.end.length-1),u!==-1&&(f=a.createRng(),f.setStart(l,u),f.setEnd(l,c-p),h=n(f.toString()),h&&h.end&&!(l.data.length<=h.start.length+h.end.length))))))return m=e.formatter.get(h.format),m&&m[0].inline?(r(),e.formatter.apply(h.format,{},l),l):void 0}function o(){var t,i,r,o,a,s,l,c,u,d,f;if(t=e.selection,i=e.dom,t.isCollapsed()&&(l=i.getParent(t.getStart(),"p"))){for(u=new tinymce.dom.TreeWalker(l,l);a=u.next();)if(3==a.nodeType){o=a;break}if(o){if(c=n(o.data),!c)return;if(d=t.getRng(!0),r=d.startContainer,f=d.startOffset,o==r&&(f=Math.max(0,f-c.start.length)),tinymce.trim(o.data).length==c.start.length)return;c.format&&(s=e.formatter.get(c.format),s&&s[0].block&&(o.deleteData(0,c.start.length),e.formatter.apply(c.format,{},o),d.setStart(r,f),d.collapse(!0),t.setRng(d))),c.cmd&&e.undoManager.transact(function(){o.deleteData(0,c.start.length),e.execCommand(c.cmd)})}}}function a(){var t,n;n=r(),n&&(t=e.dom.createRng(),t.setStart(n,n.data.length),t.setEnd(n,n.data.length),e.selection.setRng(t)),o()}function s(){var t,n,i,o,a;t=r(!0),t&&(a=e.dom,n=t.data.slice(-1),/[\u00a0 ]/.test(n)&&(t.deleteData(t.data.length-1,1),i=a.doc.createTextNode(n),t.nextSibling?a.insertAfter(i,t.nextSibling):t.parentNode.appendChild(i),o=a.createRng(),o.setStart(i,1),o.setEnd(i,1),e.selection.setRng(o)))}var l,c=!0;l=e.settings.textpattern_patterns||[{start:"*",end:"*",format:"italic"},{start:"**",end:"**",format:"bold"},{start:"#",format:"h1"},{start:"##",format:"h2"},{start:"###",format:"h3"},{start:"####",format:"h4"},{start:"#####",format:"h5"},{start:"######",format:"h6"},{start:"1. ",cmd:"InsertOrderedList"},{start:"* ",cmd:"InsertUnorderedList"},{start:"- ",cmd:"InsertUnorderedList"}],e.on("keydown",function(e){13!=e.keyCode||tinymce.util.VK.modifierPressed(e)||a()},!0),e.on("keyup",function(e){32!=e.keyCode||tinymce.util.VK.modifierPressed(e)||s()}),this.getPatterns=t,this.setPatterns=function(e){l=e,c=!0}});