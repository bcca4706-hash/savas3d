#!/data/data/com.termux/files/usr/bin/bash
# Cephe 3D kurulum — Termux. Önce: termux-setup-storage
set -e
cd "$(dirname "$0")"
pkg install -y nodejs unzip git >/dev/null 2>&1 || true

echo "== npm paketleri"
npm install
npm run prep

echo "== asset zip'leri (~/storage/downloads)"
RAW=assets_raw; mkdir -p $RAW www/assets/models www/assets/sounds
shopt -s nullglob nocasematch
for z in ~/storage/downloads/*.zip; do
  case "$(basename "$z")" in
    *blaster*|*shooter*|*soldier*|*character*|*nature*|*impact*|*sci-fi*|*survival*)
      unzip -oq "$z" -d "$RAW/$(basename "$z" .zip)"; echo "  açıldı: $(basename "$z")";;
  esac
done

pick(){ # pick <find-desen> <hedef> [grep-regex]
  local f; f=$(find $RAW -iname "$1" 2>/dev/null | grep -iE "${3:-.}" | head -1 || true)
  if [ -n "$f" ]; then cp "$f" "$2"; echo "  ✓ $2 ← ${f#$RAW/}"; else echo "  – $2 yok → yedek model"; fi
}
echo "== model/ses seçimi"
pick "*.glb" www/assets/models/gun.glb    "blaster"
pick "*.glb" www/assets/models/enemy.glb  "soldier|swat|character|enemy"
pick "*.glb" www/assets/models/cover.glb  "crate|barrel|box|barricade"
pick "*.glb" www/assets/models/tree.glb   "tree"
pick "*.ogg" www/assets/sounds/shot.ogg   "shot|laser|gun"
pick "*.ogg" www/assets/sounds/hit.ogg    "impact|punch|hit"

echo "== bitti. Tarayıcıda test: npx http-server www -p 8080  → http://localhost:8080"
echo "   Yayın: git add . && git commit -m ilk && git push  (Actions AAB üretir)"
echo "   İmza: jarsigner -keystore ~/ks.keystore app-release.aab oklar"
