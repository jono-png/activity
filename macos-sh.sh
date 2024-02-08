read -p "Enter the number of minutes to keep the system awake: " duration
let "durationInSeconds = $duration * 60"

while [ $durationInSeconds -gt 0 ]; do
    sleep 60
    osascript -e 'tell application "System Events" to key code 63' # key code for fn key
    let "durationInSeconds -= 60"
done

echo "System will now return to normal behavior."
