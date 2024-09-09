(function () {
  const textUI = document.querySelector(".text-ui");
  const notificationsContainer = document.createElement("div");
  notificationsContainer.classList.add("notifications");
  document.body.appendChild(notificationsContainer);

  function applyPosition(position = 'right-center') {
    textUI.classList.remove('right-center', 'left-center', 'top-center', 'bottom-center');
    textUI.classList.add(position);
  }

  function showNotification(message, type = "success") {
    const notification = document.createElement("div");
    notification.classList.add("notification", type);

    const icon = document.createElement("span");
    icon.classList.add("icon");
    icon.innerHTML = type === "success" ? "✔" : "✖";

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
      applyPosition(data.position);
      
      const str = data.text.replace(/\[(.+?)\]/g, (_, key) => `<kbd>${key}</kbd>`);
      textUI.innerHTML = str;
      textUI.classList.add("visible");
    } else if (data.type === "hide-textUI") {
      textUI.classList.remove("visible");
    }

    if (data.type === "notification") {
      showNotification(data.message, data.notificationType);
    }
  });

  /*
  setTimeout(() => {
    const event = new Event("message");
    event.data = {
      type: "notification",
      message: "Operation completed successfully!",
      notificationType: "success",
    };
    window.dispatchEvent(event);
  }, 1000);

  setTimeout(() => {
    const event = new Event("message");
    event.data = {
      type: "show-textUI",
      text: "Press [E] to interact",
      position: "left-center"
    };
    window.dispatchEvent(event);
  }, 2000);

  setTimeout(() => {
    const event = new Event("message");
    event.data = {
      type: "notification",
      message: "An error occurred.",
      notificationType: "error",
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
