import type { PluggableList } from "unified"

export const DarkmodeFix = () => {
  const name = "DarkmodeFix"
  
  const htmlPlugins = (): PluggableList => {
    return [
      () => (tree: any) => {
        // Add darkmode fix script before closing body tag
        const scriptContent = `(function(){
var pref=window.matchMedia("(prefers-color-scheme: light)").matches?"light":"dark";
var theme=localStorage.getItem("theme")||pref;
document.documentElement.setAttribute("saved-theme",theme);
document.body.classList.remove("theme-dark","theme-light");
document.body.classList.add("theme-"+theme);
function applyTheme(t){
document.documentElement.setAttribute("saved-theme",t);
document.body.classList.remove("theme-dark","theme-light");
document.body.classList.add("theme-"+t);
localStorage.setItem("theme",t);
var btns=document.querySelectorAll(".darkmode");
for(var i=0;i<btns.length;i++){
var btn=btns[i];
var dayIcon=btn.querySelector(".dayIcon");
var nightIcon=btn.querySelector(".nightIcon");
if(t==="dark"){
btn.setAttribute("aria-label","Light mode");
if(dayIcon)dayIcon.style.display="inline";
if(nightIcon)nightIcon.style.display="none";
}else{
btn.setAttribute("aria-label","Dark mode");
if(dayIcon)dayIcon.style.display="none";
if(nightIcon)nightIcon.style.display="inline";
}
}
}
function toggle(){
var cur=document.documentElement.getAttribute("saved-theme")||"dark";
applyTheme(cur==="dark"?"light":"dark");
}
function setup(){
var btns=document.querySelectorAll(".darkmode");
for(var i=0;i<btns.length;i++){
var btn=btns[i];
var newBtn=btn.cloneNode(true);
btn.parentNode.replaceChild(newBtn,btn);
newBtn.addEventListener("click",toggle);
}
applyTheme(document.documentElement.getAttribute("saved-theme")||"dark");
}
setup();
document.addEventListener("nav",setup);
document.addEventListener("render",setup);
})();`
        
        const scriptNode = {
          type: "element" as const,
          tagName: "script" as const,
          properties: {} as Record<string, unknown>,
          children: [{ type: "text" as const, value: scriptContent }]
        }
        
        // Find body tag and append script
        const bodyIndex = tree.children.findIndex(
          (n: any) => n.type === "element" && n.tagName === "body"
        )
        if (bodyIndex >= 0) {
          tree.children.splice(bodyIndex, 0, scriptNode)
        }
      }
    ]
  }
  
  return { name, htmlPlugins }
}
