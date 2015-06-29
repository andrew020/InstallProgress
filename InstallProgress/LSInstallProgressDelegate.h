/* Generated by RuntimeBrowser
 Image: /System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices
 */

@interface LSInstallProgressDelegate : NSObject <LSInstallProgressProtocol, NSXPCListenerDelegate> {
    NSMutableSet *_inactiveInstalls;
    NSObject<OS_dispatch_queue> *_installControlsQueue;
    NSMutableDictionary *_installIndexes;
    NSMutableDictionary *_observers;
    NSObject<OS_dispatch_queue> *_observersQueue;
    NSMutableOrderedSet *_orderedInstalls;
    LSInstallProgressList *_progresses;
    BOOL _usingNetwork;
    LSObserverTimer *didUninstallTimer;
    LSObserverTimer *iconsUpdatedTimer;
    LSObserverTimer *installsFinishedTimer;
    LSObserverTimer *installsStartedTimer;
    LSObserverTimer *installsUpdatedTimer;
}

@property (readonly, copy) NSString *debugDescription;
@property (readonly, copy) NSString *description;
@property (readonly) unsigned int hash;
@property (readonly) Class superclass;

- (void)addObserver:(id)arg1 withUUID:(id)arg2;
- (void)beginObservingConnection;
- (void)createInstallProgressForApplication:(id)arg1 withPhase:(unsigned int)arg2 andPublishingString:(id)arg3;
- (void)dealloc;
- (void)endObservingConnection;
- (void)handleCancelInstallationForApp:(id)arg1;
- (id)init;
- (void)installationEndedForApplication:(id)arg1;
- (void)installationFailedForApplication:(id)arg1 reply:(id /* block */)arg2;
- (BOOL)listener:(id)arg1 shouldAcceptNewConnection:(id)arg2;
- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void*)arg4;
- (id)parentProgressForApplication:(id)arg1 andPhase:(unsigned int)arg2 isActive:(BOOL)arg3;
- (void)placeholderInstalledForApp:(id)arg1;
- (void)rebuildInstallIndexes;
- (void)removeObserverWithUUID:(id)arg1;
- (void)restoreInactiveInstalls;
- (void)sendAppControlsNotificationForApp:(id)arg1 withName:(id)arg2;
- (void)sendChangeNotificationForApp:(id)arg1;
- (void)sendFailedNotificationForApp:(id)arg1 isUninstall:(BOOL)arg2;
- (void)sendIconUpdatedNotificationForApp:(id)arg1;
- (void)sendInstalledNotificationForApp:(id)arg1 reply:(id /* block */)arg2;
- (void)sendInstalledNotificationForApps:(id)arg1;
- (void)sendNetworkUsageChangedNotification;
- (void)sendUninstalledNotificationForApp:(id)arg1 reply:(id /* block */)arg2;
- (void)sendUninstalledNotificationForApps:(id)arg1;
- (void)sendWillUninstallNotificationForApps:(id)arg1 Plugins:(id)arg2 isUpdate:(BOOL)arg3;

@end