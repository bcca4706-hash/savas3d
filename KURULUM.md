# Cephe 3D — kurulum

## 1) Assetleri indir (hepsi CC0, telefondan Downloads'a zip olarak)
| Paket | Ne için | Sayfa |
|---|---|---|
| Kenney Blaster Kit | Oyuncu silahı | https://kenney.nl/assets/blaster-kit |
| Quaternius Toon Shooter Game Kit | Animasyonlu düşman asker + sandık/bariyer | https://quaternius.com (Packs) |
| Kenney Nature Kit | Ağaçlar | https://kenney.nl/assets/nature-kit |
| Kenney Sci-fi Sounds | Atış sesi | https://kenney.nl/assets/sci-fi-sounds |
| Kenney Impact Sounds | İsabet sesi | https://kenney.nl/assets/impact-sounds |

Hiçbiri yoksa da oyun çalışır: silah, asker, siper, ağaç ve sesler kodla üretilir.

## 2) Termux
    termux-setup-storage
    unzip savas3d.zip -d ~ && cd ~/savas3d && bash setup.sh

## 3) GitHub
    git init -b main && git add . && git commit -m ilk
    git remote add origin https://github.com/bcca4706-hash/savas3d.git && git push -u origin main
Actions → build-aab → artifact indir.

## 4) İmza
    jarsigner -keystore ~/ks.keystore app-release.aab oklar

## Ayarlar (index.html → CFG)
- gunRotY / enemyRotY: model ters duruyorsa değiştir
- interstitial + build.yml'deki ADMOB_APP_ID: kendi ID'lerin
- Model yolları: www/assets/models/{gun,enemy,cover,tree}.glb
