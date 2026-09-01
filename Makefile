run:
	flutter emulators --launch flutter_emulator
	@echo Waiting for device...
	@adb wait-for-device
	@powershell -NoProfile -Command "while ((adb shell getprop sys.boot_completed) -ne '1') { Start-Sleep -s 2 }"
	flutter run -d emulator-5554
