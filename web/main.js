(function () {
  const textUI = document.querySelector(".text-ui");
  const notificationsContainer = document.createElement("div");
  notificationsContainer.classList.add("notifications");
  document.body.appendChild(notificationsContainer);

  function applyPosition(element, position = 'right-center') {
    element.classList.remove('right-center', 'left-center', 'top-center', 'bottom-center');
    element.classList.add(position);
  }

  function showNotification(message, type = "success", position = "right-center") {
    const notification = document.createElement("div");
    notification.classList.add("notification", type);
    applyPosition(notification, position);

    const icon = document.createElement("span");
    icon.classList.add("icon");

    switch (type) {
      case "success":
        icon.innerHTML = "✔";
        break;
      case "error":
        icon.innerHTML = "✖";
        break;
      case "warning":
        icon.innerHTML = "⚠";
        break;
      case "inform":
        icon.innerHTML = "ℹ";
        break;
    }

    const messageText = document.createElement("span");
    messageText.classList.add("message");
    messageText.textContent = message;

    notification.appendChild(icon);
    notification.appendChild(messageText);
    notificationsContainer.appendChild(notification);

    setTimeout(() => {
      notification.classList.add("hide");
      setTimeout(() => notification.remove(), 500);
    }, 5000);
  }

  window.addEventListener("message", (evt) => {
    const { data } = evt;

    if (!data) return;

    if (data.type === "show-textUI") {
      applyPosition(textUI, data.position || 'right-center');
      
      const str = data.text.replace(/\[(.+?)\]/g, (_, key) => `<kbd>${key}</kbd>`);
      textUI.innerHTML = str;
      textUI.classList.add("visible");
    } else if (data.type === "hide-textUI") {
      textUI.classList.remove("visible");
    }

    if (data.type === "notification") {
      showNotification(data.message, data.notificationType || 'inform', data.position || 'right-center');
    }
  });
  /* Testing
  setTimeout(() => {
    const event = new Event("message");
    event.data = {
      type: "notification",
      message: "Operation completed successfully!",
      notificationType: "success",
      position: "left-center"
    };
    window.dispatchEvent(event);
  }, 1000);

  setTimeout(() => {
    const event = new Event("message");
    event.data = {
      type: "show-textUI",
      text: "Press [E] to interact",
      position: "top-center"
    };
    window.dispatchEvent(event);
  }, 2000);

  setTimeout(() => {
    const event = new Event("message");
    event.data = {
      type: "notification",
      message: "An error occurred.",
      notificationType: "error",
      position: "bottom-center"
    };
    window.dispatchEvent(event);
  }, 3000);
  setTimeout(() => {
    const event = new Event("message");
    event.data = {
      type: "notification",
      message: "I am warning you.",
      notificationType: "warning",
      position: "bottom-center"
    };
    window.dispatchEvent(event);
  }, 3000);
  setTimeout(() => {
    const event = new Event("message");
    event.data = {
      type: "notification",
      message: "I am telling you something!",
      notificationType: "inform",
      position: "bottom-center"
    };
    window.dispatchEvent(event);
  }, 3000);

  setTimeout(() => {
    const event = new Event("message");
    event.data = { type: "hide-textUI" };
    window.dispatchEvent(event);
  }, 5000);
  */
})();
