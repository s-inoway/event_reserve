function wordCount() {
  const title = document.getElementById("title");
  const titleCount = document.getElementById("title-count");
  title.addEventListener("input", () => {
    titleNumber = title.value.length;
    titleCount.innerHTML = `${titleNumber}`;
  });

  // いずれ繰り返し表記をクラス使って直したい…

  const comment = document.getElementById("comment");
  const commentCount = document.getElementById("comment-count");
  comment.addEventListener("input", () => {
    commentNumber = comment.value.length;
    commentCount.innerHTML = `${commentNumber}`;
  });

  const bring = document.getElementById("bring");
  const bringCount = document.getElementById("bring-count");
  bring.addEventListener("input", () => {
    bringNumber = bring.value.length;
    bringCount.innerHTML = `${bringNumber}`;
  });
};

window.addEventListener("load", wordCount);