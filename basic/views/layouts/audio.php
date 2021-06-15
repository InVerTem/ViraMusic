<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\Json;
use app\models\Track;

$message = Json::htmlEncode(Yii::t('app', 'No results found.'));

$this->registerJs(
<<<JS

    $('body').on('click', '.start-audio', function(e) {

        let buttonPlayId = 'play_' + e.currentTarget.dataset.type + '_' + e.currentTarget.dataset.content + '_' + e.currentTarget.dataset.track;

        $.ajax({
            url: '/track/audio',
            data: {
                type: this.dataset.type,
                content: this.dataset.content,
                track: this.dataset.track,
                order: this.dataset.order,
                user: this.dataset.user ? this.dataset.user : null
            },
            type: 'post',
            dataType: 'json',
            success: function(data) {

                if(data.tracksData.length === 0) {

                    alert($message);

                } else if(localStorage.buttonPlayId === buttonPlayId) {

                    audioPlay();

                } else {

                    localStorage.tracksData = JSON.stringify(data.tracksData);
                    localStorage.track = data.trackId ? data.trackId : 0;

                    localStorage.buttonPlayId = buttonPlayId;

                    if(localStorage.random === 'true') {

                        if(data.trackId === null) {

                            localStorage.track = randomInteger(0, data.tracksData.length - 1);
                        }

                        shuffle();
                    }

                    setTrack();
                    startTrack();
                }
            }
        });
    });

JS
);
?>

<div class="audio">

    <div id="progress-bar">

        <div id="progress-img"></div>
        <div id="progress"></div>
        <div id="buffered"></div>
        <p id="progress-value"></p>

    </div>

    <div class="buttons">

        <svg class="skip-backward-fill" onclick="nextTrack(-1)"><path/></svg>
        <svg id="play" class="play-fill" onclick="audioPlay()"><path/></svg>
        <svg class="skip-forward-fill" onclick="nextTrack(1)"><path/></svg>

    </div>

    <div class="info">

        <a id="albumInfo" class="pjax-link" href="#"><img id="albumImage" src="<?= Yii::$app->params['defaultImage'] ?>"></a>
        <a id="trackInfo" class="pjax-link" href="#"></a>
        <a id="artistInfo" class="signature pjax-link" href="#"></a>
        <svg id="heartInfo" class="heart-link" data-type="<?= Track::CONTENT_TYPE_ID ?>"><path/></svg>

    </div>

    <div class="buttons controls">

        <svg id="buttonRandom" class="random" onclick="audioRandom(this)"><path/></svg>
        <svg id="buttonLoop" class="loop" onclick="audioLoop(this)"><path/></svg>

        <svg id="buttonVolume" class="volume-up-fill" onclick="audioMuted()"><path/></svg>
        <input id="audioVolume" oninput="audioVolumeChange(this)" type="range" name="points" min="0" max="100">

    </div>

</div>

<script>

    var
	    audio = new Audio(),
        play = document.getElementById('play'),
        buttonVolume = document.getElementById('buttonVolume'),
        audioVolume = document.getElementById('audioVolume'),
        progressBar = document.getElementById('progress-bar'),
        progressImg = document.getElementById('progress-img'),
        progress = document.getElementById('progress'),
        buffered = document.getElementById('buffered'),
        progressValue = document.getElementById('progress-value');

    var audioPlay = function() {

	    if(localStorage.track === undefined) {

            return;

        } else if(audio.readyState === 0 && audio.src !== '') {

            alert(<?= $message ?>);
        }

        audio.paused ? audio.play() : audio.pause();
    };

    var setInfoTrack = function() {

        let track = JSON.parse(localStorage.tracksData)[localStorage.track];

        let albumInfo = document.getElementById('albumInfo');

        albumInfo.href = `/album/view?id=${track.album}`;
        albumInfo.dataset.popupHint = track.albumName;

        document.getElementById('albumImage').src = `/uploads/${track.albumImage}`;

        let trackName = document.getElementById('trackInfo');

        trackName.href = `/track/view?id=${track.id}`;
        trackName.innerHTML = track.trackName;

        let artistName = document.getElementById('artistInfo');

        artistName.href = `/artist/view?id=${track.artist}`;
        artistName.innerHTML = track.artistName;

        let heartInfo = document.getElementById('heartInfo');

        heartInfo.dataset.content = track.id;

        if(track.status === '1') {

            if(!heartInfo.classList.contains('heart-fill')) {

                heartInfo.classList.toggle('heart-fill');
            }

            if(heartInfo.classList.contains('heart')) {

                heartInfo.classList.toggle('heart');
            }

        } else {

            if(!heartInfo.classList.contains('heart')) {

                heartInfo.classList.toggle('heart');
            }

            if(heartInfo.classList.contains('heart-fill')) {

                heartInfo.classList.toggle('heart-fill');
            }
        }
    };



    var audioRandom = function(e) {

        e.classList.toggle('active');
        localStorage.random = localStorage.random === 'true' ? 'false' : 'true';

        if(localStorage.tracksData === undefined) {

            return;
        }

        if(localStorage.random === 'true') {

            shuffle();

        } else {

            let tracksData = JSON.parse(localStorage.tracksData);

            localStorage.track = tracksData[localStorage.track].key;

            tracksData.sort(function(a, b) {
                return a.key - b.key;
            });

            localStorage.tracksData = JSON.stringify(tracksData);
        }
    };

    var shuffle = function() {

        let
            track = Number(localStorage.track),
            tracksData = JSON.parse(localStorage.tracksData),
            currentTrack = tracksData.slice().splice(track, 1),
            upTracks = tracksData.slice(0, track),
            downTracks = tracksData.slice(track + 1),
            newTracksData = upTracks.concat(downTracks);

        newTracksData.sort(() => Math.random() - 0.5);
        newTracksData = currentTrack.concat(newTracksData);

        localStorage.track = 0;
        localStorage.tracksData = JSON.stringify(newTracksData);
    };

    var audioLoop = function(e) {

        e.classList.toggle('active');
        localStorage.loop = String(audio.loop = !audio.loop);
    };

    var audioVolumeChange = function(e) {

        let eV = e.value;

        audioSetVolume(eV);

        localStorage.volume = eV;
        eV = Math.ceil(eV * (eV / 100));
        e.dataset.popupHint = `${eV}%`;
        audio.volume = eV / 100;
    };

    var audioSetVolume = function(value) {

        if(value >= 66) {

            buttonVolume.className.baseVal = 'volume-up-fill';

        } else if(value < 66 && value >= 33) {

            buttonVolume.className.baseVal = 'volume-middle-fill';

        } else if(value < 33 && value > 0) {

            buttonVolume.className.baseVal = 'volume-down-fill';

        } else if(value == 0) {

            buttonVolume.className.baseVal = 'volume-mute-fill';
        }
    };

    var audioMuted = function() {

        audioVolume.value = 0;
        localStorage.muted = audio.muted = !audio.muted;

        if(localStorage.muted === 'false') {

            audioVolume.value = localStorage.volume;
        }

        audioSetVolume(audioVolume.value);
    };



    var nextTrack = function(e) {

        if(localStorage.tracksData === undefined) {

            return;
        }

        let
            nextTrack = Number(localStorage.track) + e,
            tracksData = JSON.parse(localStorage.tracksData),
            countTracks = tracksData.length;

        localStorage.track = nextTrack >= countTracks ? 0 : (nextTrack < 0 ? countTracks - 1 : nextTrack);

        let buttonPlayIdArray = localStorage.buttonPlayId.split('_');
        buttonPlayIdArray[buttonPlayIdArray.length - 1] = tracksData[localStorage.track].id;
        localStorage.buttonPlayId = buttonPlayIdArray.join('_');

        setTrack();
        startTrack();
    };

    var setTrack = function() {

        if(localStorage.tracksData === undefined) {

            return;
        }

        let
            tracksData = JSON.parse(localStorage.tracksData),
            track = JSON.parse(localStorage.track);

        audio.src = '/uploads/' + tracksData[track].file;
        setInfoTrack();
    };

    var startTrack = function() {

        progressImg.style.left = '0%';
        progress.style.width = '0%';
        buffered.style.width = '0%';
        progressValue.innerHTML = '';

        localStorage.time = audio.currentTime = 0;

        if(audio.readyState) {

            audioPlay();

        } else {

            setTimeout(startTrack, 16);
        }
    };



    progressBar.addEventListener('click', function(e) {

        if(localStorage.tracksData === undefined) {

            return;
        }

        audio.currentTime = audio.duration * (e.clientX / progressBar.clientWidth);
    });

    audio.ontimeupdate = function() {

        if(audio.paused) {

            let
                buttonsPlay = document.getElementsByClassName('pause-fill'),
                buttonsPlayId = [];

            for(value of buttonsPlay) {

                buttonsPlayId.push(value.id);
            }

            buttonsPlayId.forEach(function(item) {

                let buttonPlay = document.getElementById(item);

                buttonPlay.classList.toggle('play-fill');
                buttonPlay.classList.toggle('pause-fill');
            });
        }

        if(!audio.paused) {

            if(play.classList.contains('play-fill')) {

                play.classList.toggle('play-fill');
                play.classList.toggle('pause-fill');
            }

            let buttonPlay = document.getElementById(localStorage.buttonPlayId);

            if(
                buttonPlay &&
                buttonPlay.classList.contains('play-fill')
            ) {

                buttonPlay.classList.toggle('play-fill');
                buttonPlay.classList.toggle('pause-fill');
            }
        }

        if(audio.readyState) {

            let
                currentTimeTrack = audio.currentTime,
                currentMinutes = Math.floor(currentTimeTrack / 60),
                currentSeconds = Math.floor(currentTimeTrack - currentMinutes * 60),
                timeTrack = audio.duration,
                prBar = currentTimeTrack / timeTrack * 100,
                minutes = Math.floor(timeTrack / 60),
                seconds = Math.floor(timeTrack - minutes * 60);

            if(String(currentSeconds).length === 1) {

                currentSeconds = '0' + currentSeconds;
            }

            if(String(seconds).length === 1) {

                seconds = '0' + seconds;
            }

            progressImg.style.left = `${prBar}%`;
            progress.style.width = `${prBar}%`;
            buffered.style.width = audio.buffered.end(0) / audio.duration * 100 + '%';
            progressValue.innerHTML = currentMinutes + ':' + currentSeconds + ' / ' + minutes + ':' + seconds;

            localStorage.time = audio.currentTime;

            if(audio.ended && !audio.loop) {

                nextTrack(1);
            }
        }
    };



    var randomInteger = function(min, max) {

        return Math.floor(min + Math.random() * (max + 1 - min));
    };



    (function() {

        if(localStorage.random !== undefined) {

            if(localStorage.random === 'true') {

                audio.random = true;
                document.getElementById('buttonRandom').classList.toggle('active');

            } else {

                audio.random = false;
            }

        } else {

            localStorage.random = 'false';
        }



        if(localStorage.muted !== undefined) {

            if(localStorage.muted === 'true') {

                audio.muted = true;

            } else {

                audio.muted = false;
            }

        } else {

            localStorage.muted = audio.muted;
        }



        if(localStorage.loop !== undefined) {

            if(localStorage.loop === 'true') {

                audio.loop = true;
                buttonLoop.classList.toggle('active');

            } else {

                audio.loop = false;
            }

        } else {

            localStorage.loop = audio.loop;
        }



        if(localStorage.volume === undefined) {

            localStorage.volume = 2;
        }

        let vol = localStorage.volume;

        audio.muted ? audioVolume.value = 0 : audioVolume.value = vol;

        vol = Math.ceil(vol * (vol / 100));
        audioVolume.dataset.popupHint = `${vol}%`;
        audio.volume = vol / 100;

        audioSetVolume(audioVolume.value);



        localStorage.time === undefined ? localStorage.time = 0 : audio.currentTime = localStorage.time;



        setTrack();
    }());

</script>