tinymce.PluginManager.add("fullpage",function(e){function t(){var t=n();e.windowManager.open({title:"Document properties",data:t,defaults:{type:"textbox",size:40},body:[{name:"title",label:"Title"},{name:"keywords",label:"Keywords"},{name:"description",label:"Description"},{name:"robots",label:"Robots"},{name:"author",label:"Author"},{name:"docencoding",label:"Encoding"}],onSubmit:function(e){i(tinymce.extend(t,e.data))}})}function n(){function t(e,t){var n=e.attr(t);return n||""}var n,i,o=r(),a={};return a.fontface=e.getParam("fullpage_default_fontface",""),a.fontsize=e.getParam("fullpage_default_fontsize",""),n=o.firstChild,7==n.type&&(a.xml_pi=!0,i=/encoding="([^"]+)"/.exec(n.value),i&&(a.docencoding=i[1])),n=o.getAll("#doctype")[0],n&&(a.doctype="<!DOCTYPE"+n.value+">"),n=o.getAll("title")[0],n&&n.firstChild&&(a.title=n.firstChild.value),u(o.getAll("meta"),function(e){var t,n=e.attr("name"),i=e.attr("http-equiv");n?a[n.toLowerCase()]=e.attr("content"):"Content-Type"==i&&(t=/charset\s*=\s*(.*)\s*/gi.exec(e.attr("content")),t&&(a.docencoding=t[1]))}),n=o.getAll("html")[0],n&&(a.langcode=t(n,"lang")||t(n,"xml:lang")),a.stylesheets=[],tinymce.each(o.getAll("link"),function(e){"stylesheet"==e.attr("rel")&&a.stylesheets.push(e.attr("href"))}),n=o.getAll("body")[0],n&&(a.langdir=t(n,"dir"),a.style=t(n,"style"),a.visited_color=t(n,"vlink"),a.link_color=t(n,"link"),a.active_color=t(n,"alink")),a}function i(t){function n(e,t,n){e.attr(t,n?n:void 0)}function i(e){a.firstChild?a.insert(e,a.firstChild):a.append(e)}var o,a,s,c,f,h=e.dom;o=r(),a=o.getAll("head")[0],a||(c=o.getAll("html")[0],a=new d("head",1),c.firstChild?c.insert(a,c.firstChild,!0):c.append(a)),c=o.firstChild,t.xml_pi?(f='version="1.0"',t.docencoding&&(f+=' encoding="'+t.docencoding+'"'),7!=c.type&&(c=new d("xml",7),o.insert(c,o.firstChild,!0)),c.value=f):c&&7==c.type&&c.remove(),c=o.getAll("#doctype")[0],t.doctype?(c||(c=new d("#doctype",10),t.xml_pi?o.insert(c,o.firstChild):i(c)),c.value=t.doctype.substring(9,t.doctype.length-1)):c&&c.remove(),c=null,u(o.getAll("meta"),function(e){"Content-Type"==e.attr("http-equiv")&&(c=e)}),t.docencoding?(c||(c=new d("meta",1),c.attr("http-equiv","Content-Type"),c.shortEnded=!0,i(c)),c.attr("content","text/html; charset="+t.docencoding)):c&&c.remove(),c=o.getAll("title")[0],t.title?(c?c.empty():(c=new d("title",1),i(c)),c.append(new d("#text",3)).value=t.title):c&&c.remove(),u("keywords,description,author,copyright,robots".split(","),function(e){var n,r,a=o.getAll("meta"),s=t[e];for(n=0;n<a.length;n++)if(r=a[n],r.attr("name")==e)return void(s?r.attr("content",s):r.remove());s&&(c=new d("meta",1),c.attr("name",e),c.attr("content",s),c.shortEnded=!0,i(c))});var p={};tinymce.each(o.getAll("link"),function(e){"stylesheet"==e.attr("rel")&&(p[e.attr("href")]=e)}),tinymce.each(t.stylesheets,function(e){p[e]||(c=new d("link",1),c.attr({rel:"stylesheet",text:"text/css",href:e}),c.shortEnded=!0,i(c)),delete p[e]}),tinymce.each(p,function(e){e.remove()}),c=o.getAll("body")[0],c&&(n(c,"dir",t.langdir),n(c,"style",t.style),n(c,"vlink",t.visited_color),n(c,"link",t.link_color),n(c,"alink",t.active_color),h.setAttribs(e.getBody(),{style:t.style,dir:t.dir,vLink:t.visited_color,link:t.link_color,aLink:t.active_color})),c=o.getAll("html")[0],c&&(n(c,"lang",t.langcode),n(c,"xml:lang",t.langcode)),a.firstChild||a.remove(),s=new tinymce.html.Serializer({validate:!1,indent:!0,apply_source_formatting:!0,indent_before:"head,html,body,meta,title,script,link,style",indent_after:"head,html,body,meta,title,script,link,style"}).serialize(o),l=s.substring(0,s.indexOf("</body>"))}function r(){return new tinymce.html.DomParser({validate:!1,root_name:"#document"}).parse(l)}function o(t){function n(e){return e.replace(/<\/?[A-Z]+/g,function(e){return e.toLowerCase()})}var i,o,s,d,f=t.content,h="",p=e.dom;if(!t.selection&&!("raw"==t.format&&l||t.source_view&&e.getParam("fullpage_hide_in_source_view"))){0!==f.length||t.source_view||(f=tinymce.trim(l)+"\n"+tinymce.trim(f)+"\n"+tinymce.trim(c)),f=f.replace(/<(\/?)BODY/gi,"<$1body"),i=f.indexOf("<body"),i!=-1?(i=f.indexOf(">",i),l=n(f.substring(0,i+1)),o=f.indexOf("</body",i),o==-1&&(o=f.length),t.content=f.substring(i+1,o),c=n(f.substring(o))):(l=a(),c="\n</body>\n</html>"),s=r(),u(s.getAll("style"),function(e){e.firstChild&&(h+=e.firstChild.value)}),d=s.getAll("body")[0],d&&p.setAttribs(e.getBody(),{style:d.attr("style")||"",dir:d.attr("dir")||"",vLink:d.attr("vlink")||"",link:d.attr("link")||"",aLink:d.attr("alink")||""}),p.remove("fullpage_styles");var m=e.getDoc().getElementsByTagName("head")[0];h&&(p.add(m,"style",{id:"fullpage_styles"},h),d=p.get("fullpage_styles"),d.styleSheet&&(d.styleSheet.cssText=h));var g={};tinymce.each(m.getElementsByTagName("link"),function(e){"stylesheet"==e.rel&&e.getAttribute("data-mce-fullpage")&&(g[e.href]=e)}),tinymce.each(s.getAll("link"),function(e){var t=e.attr("href");return!t||(g[t]||"stylesheet"!=e.attr("rel")||p.add(m,"link",{rel:"stylesheet",text:"text/css",href:t,"data-mce-fullpage":"1"}),void delete g[t])}),tinymce.each(g,function(e){e.parentNode.removeChild(e)})}}function a(){var t,n="",i="";return e.getParam("fullpage_default_xml_pi")&&(n+='<?xml version="1.0" encoding="'+e.getParam("fullpage_default_encoding","ISO-8859-1")+'" ?>\n'),n+=e.getParam("fullpage_default_doctype","<!DOCTYPE html>"),n+="\n<html>\n<head>\n",(t=e.getParam("fullpage_default_title"))&&(n+="<title>"+t+"</title>\n"),(t=e.getParam("fullpage_default_encoding"))&&(n+='<meta http-equiv="Content-Type" content="text/html; charset='+t+'" />\n'),(t=e.getParam("fullpage_default_font_family"))&&(i+="font-family: "+t+";"),(t=e.getParam("fullpage_default_font_size"))&&(i+="font-size: "+t+";"),(t=e.getParam("fullpage_default_text_color"))&&(i+="color: "+t+";"),n+="</head>\n<body"+(i?' style="'+i+'"':"")+">\n"}function s(t){t.selection||t.source_view&&e.getParam("fullpage_hide_in_source_view")||(t.content=tinymce.trim(l)+"\n"+tinymce.trim(t.content)+"\n"+tinymce.trim(c))}var l,c,u=tinymce.each,d=tinymce.html.Node;e.addCommand("mceFullPageProperties",t),e.addButton("fullpage",{title:"Document properties",cmd:"mceFullPageProperties"}),e.addMenuItem("fullpage",{text:"Document properties",cmd:"mceFullPageProperties",context:"file"}),e.on("BeforeSetContent",o),e.on("GetContent",s)});