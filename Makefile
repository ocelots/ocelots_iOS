
default:
	xcodebuild -target "Ocelots_iOS_Test(Device)" -configuration Release
	xcodebuild -target "Ocelots_iOS_Test(Simulator)" -configuration Release
	BUILD_DIR="build" BUILD_STYLE="Release" sh ../Scripts/CombineLibs.sh
	sh ../Scripts/iOSFramework.sh

# If you need to clean a specific target/configuration: $(COMMAND) -target $(TARGET) -configuration DebugOrRelease -sdk $(SDK) clean
clean:
	-rm -rf build/*

test:
	GHUNIT_CLI=1 xcodebuild -target Ocelots_iOS_Test -configuration Debug -sdk iphonesimulator build
