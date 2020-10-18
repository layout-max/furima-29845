document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('message-image');
      // 選択した画像を表示する関数
      const createImageHTML = (blob) => {
        // 画像を表示するためのdiv要素を生成
       const imageElement = document.createElement('div');
 
       // 表示する画像を生成
       const blobImage = document.createElement('img');
       blobImage.setAttribute('src', blob);
       // 生成したHTMLの要素をブラウザに表示させる
       //imageElement.appendChild(blobImage);
       //ImageList.appendChild(imageElement);
     };
  document.getElementById('message-view').addEventListener('change', function(e){
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    const imageElement = document.createElement('div');
    const blobImage = document.createElement('img')
    blobImage.setAttribute('src', blob);
    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
    createImageHTML(blob);
  });
});