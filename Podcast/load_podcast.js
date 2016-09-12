var url;

function updatePlayDiv(url) {
            var audio = document.getElementById('play-url');
            audio.innerHTML = "<source src=\"" + url + "\"></source>";
            audio.load(); //call this to just preload the audio without playing
            audio.play();
}


