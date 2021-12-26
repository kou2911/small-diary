function count() {
  const content = document.getElementById("diary-content");
  content.addEventListener("keyup",()=>{
    const countNum = content.value.length;
    const WordCount = document.getElementById("word-count");
    WordCount.innerHTML =`${countNum}/15`;
  });

  const placeDiary =document.getElementById("diary-place");
  placeDiary.addEventListener("keyup",()=>{
    const numCount = placeDiary.value.length;
    const PlaceCount = document.getElementById("place-count");
    PlaceCount.innerHTML =`${numCount}/30`
  });

};




window.addEventListener('load',count);