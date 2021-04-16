function preview() {
  const ImageList = document.getElementById('image-file');
  const ImageURL = document.getElementById('image-url');

  // 選択した画像を表示する関数
  const createImageHTML = (name, blob) => {
  
    // 表示する画像を生成
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    ImageList.appendChild(blobImage);
    ImageURL.innerHTML = name;
  };

  document.getElementById('hidden-btn').addEventListener('change', function(e){
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }

    const file = e.target.files[0];
    const name = file.name
    const blob = window.URL.createObjectURL(file);
    
    createImageHTML(name, blob);
  });
};

if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener('DOMContentLoaded', preview)
};
