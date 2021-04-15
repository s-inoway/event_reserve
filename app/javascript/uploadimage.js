function uploadImage() {
  const uploadBtn = document.getElementById("upload-btn");
  const hiddenBtn = document.getElementById("hidden-btn");
  uploadBtn.addEventListener("click", () => {
    hiddenBtn.click();
  });
};

window.addEventListener("load", uploadImage);