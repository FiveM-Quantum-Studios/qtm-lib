(function () {
  const textUI = document.querySelector(".text-ui");

  function applyPosition(position = 'right-center') {
    textUI.classList.remove('right-center', 'left-center', 'top-center', 'bottom-center');
    textUI.classList.add(position);
  }

  window.addEventListener("message", (evt) => {
    const { data } = evt;

    if (!data) return;

    if (data.type === "show") {
      applyPosition(data.position);
      
      const str = data.text.replace(/\[(.+?)\]/g, (_, key) => `<kbd>${key}</kbd>`);
      textUI.innerHTML = str;
      textUI.classList.add("visible");
    } else if (data.type === "hide") {
      textUI.classList.remove("visible");
    }
  });

    /* 
  function simulateShowMessage(text, position = 'right-center') {
    const event = new Event("message");
    event.data = {
      type: "show",
      text: text,
      position: position
    };
    window.dispatchEvent(event);
  }
  setTimeout(() => {
    simulateShowMessage("Press [E] to interact", "left-center");
  }, 1000);*/
})();
