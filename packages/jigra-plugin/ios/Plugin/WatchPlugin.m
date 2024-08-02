#import <Foundation/Foundation.h>
#import <Jigra/Jigra.h>

// Define the plugin using the JIG_PLUGIN Macro, and
// each method the plugin supports using the JIG_PLUGIN_METHOD macro.
JIG_PLUGIN(WatchPlugin, "Watch",
   JIG_PLUGIN_METHOD(setWatchUI, JIGPluginReturnPromise);
   JIG_PLUGIN_METHOD(updateWatchUI, JIGPluginReturnPromise);
   JIG_PLUGIN_METHOD(updateWatchData, JIGPluginReturnPromise);
);
