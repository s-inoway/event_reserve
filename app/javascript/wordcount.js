function wordCount() {
  const comment = document.getElementById("comment");

  comment.addEventListener("input", () => {
    const count = comment.value.length;
    const wordCount = document.getElementById("word-count");
    wordCount.innerHTML = `${count}`;
  });
};

window.addEventListener("load", wordCount);