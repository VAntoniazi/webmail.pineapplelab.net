VOL="poste_data"
DEST="/srv/backups/mail"
TS="$(date +%F_%H-%M-%S)"
mkdir -p "$DEST"

docker run --rm -v ${VOL}:/v:ro -v ${DEST}:/b alpine \
  sh -lc "cd /v && tar -czf /b/${VOL}_${TS}.tar.gz ."
