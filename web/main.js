(function () {
  const textUI = document.querySelector(".text-ui");

  window.addEventListener("message", (evt) => {
    const { data } = evt;
    if (!data) return;
    if (data.type === "show") {
      const str = data.text.replace(/\[(.+?)\]/g, (_, key) => `<kbd>${key}</kbd>`);
      textUI.innerHTML = str;
      textUI.classList.add("visible");
    } else if (data.type === "hide") {
      textUI.classList.remove("visible"); 
    }
  });
  /* This is to check the design on Chrome
  function simulateShowMessage(text) {
    const event = new Event("message");
    event.data = {
      type: "show",
      text: text,
    };
    window.dispatchEvent(event);
  }
  setTimeout(() => {
    simulateShowMessage("Squeeze [TAB] to kiss Saft");
  }, 1000);*/
})();
