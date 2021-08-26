$file = $args[0]

Add-Type -AssemblyName PresentationFramework

$testval = $file.ToString()

# string teilen um später eigenen namen einfügenzu können
$t = $testval.Substring(0, $testval.Length-4)

# mache kopie um nicht überschreiben zu müssen
Move-Item $file -Destination $t-old.mp4

# drehe um 90°
ffmpeg -y -i $t-old.mp4 -c copy -metadata:s:v:0 rotate=90 $file

#lösche backup datei
Remove-Item $t-old.mp4