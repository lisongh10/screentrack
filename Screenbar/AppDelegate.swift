import Cocoa
import Foundation
import AppKit
import CoreData

@available(OSX 10.13, *)
@NSApplicationMain
class AppDelegate: NSViewController, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: -2)
    let mainWindowPopover = NSPopover()
    var eventMonitor : EventMonitor?
    
//    static let applicationDelegate: AppDelegate = NSApplication.shared.delegate as! AppDelegate
//    static var SessionNumber = [Int]()
//
//    var timerScroll: Timer = Timer()
    
    var fileNameDictionary: NSMutableDictionary = NSMutableDictionary()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.addImage()
        self.initMainWindowPopover()
        self.initEventMonitor()
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectoryPath = paths[0] as String
        
        let plistFilePathInDocumentDirectory = documentDirectoryPath + "/filename.plist"
        let fileManager = FileManager.default
        let time = AppDelegate.FoldernameTime()
        if (!fileManager.fileExists(atPath: plistFilePathInDocumentDirectory)) {
            let dicContent:[String: [Int]] = [time: [0]]
            let plistContent = NSDictionary(dictionary: dicContent)

            let success:Bool = plistContent.write(toFile: plistFilePathInDocumentDirectory, atomically: true)
            if success {
                print("file has been created!")
            }else{
                print("unable to create the file")
            }
        }else{
            var nsDictionary: NSDictionary?
            nsDictionary = NSDictionary(contentsOfFile: plistFilePathInDocumentDirectory)
            
            if nsDictionary?.value(forKey: time) == nil{
                do{
                    let temp = "file://" + plistFilePathInDocumentDirectory
                    let urlofplist = URL(string : temp)
                    let data = try Data(contentsOf: urlofplist!)
                    var plist = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String : [Int]]
                    plist?.updateValue([0], forKey: time)
                    let plistData = try PropertyListSerialization.data(fromPropertyList: plist!, format: .xml, options: 0)
                    try plistData.write(to: urlofplist!)
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        let dictionaryFromFile: NSMutableDictionary? = NSMutableDictionary(contentsOfFile: plistFilePathInDocumentDirectory)
        
        if let dictionaryFromFileInDocumentDirectory = dictionaryFromFile {
            fileNameDictionary = dictionaryFromFileInDocumentDirectory
        } else {
            let plistFilePathInMainBundle: String? = Bundle.main.path(forResource: "filename", ofType: "plist")
            let dictionaryFromFileInMainBundle: NSMutableDictionary? = NSMutableDictionary(contentsOfFile: plistFilePathInMainBundle!)
            fileNameDictionary = dictionaryFromFileInMainBundle!
            
        }
        NSEvent.addGlobalMonitorForEvents(matching: .scrollWheel, handler: keyDown)
    }

    func applicationWillResignActive(_ notification: Notification) {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectoryPath = paths[0] as String
        let plistFilePathInDocumentDirectory = documentDirectoryPath + "/filename.plist"
        fileNameDictionary.write(toFile: plistFilePathInDocumentDirectory, atomically: true)
    }
    
    
    func applicationWillTerminate(_ aNotification: Notification) {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectoryPath = paths[0] as String
        let plistFilePathInDocumentDirectory = documentDirectoryPath + "/filename.plist"
        
        fileNameDictionary.write(toFile: plistFilePathInDocumentDirectory, atomically: true)
    }
    
    static func FoldernameTime() -> String{
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let Time = String(year) + "-" + String(month) + "-" + String(day)
        return Time
    }
    // set the image or icon on menubar
    func addImage() {
        if let button = statusItem.button {
            button.image = useSFSymboleIfPossible(fromOldImage: "ScreenbarIcon", toNewSFSymbol: "camera")
            statusItem.alternateImage = button.image
            statusItem.highlightMode = true
            button.action = #selector(self.showMainWindow)
        }
    }
    
    func initMainWindowPopover() {
        self.mainWindowPopover.contentViewController = MainWindowViewController(nibName: "MainWindowView", bundle: nil)
    }
    
    func initEventMonitor() {
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [unowned self] event in
            if self.mainWindowPopover.isShown {
                self.hideMainWindow(event)
            }
        }
        eventMonitor?.start()
    }
    
    //counter for sessions, initial is 0 as defalut
    func SessionCounter(counter: Int) -> Int{
        let counter = counter + 1
        return counter
    }
    
    //var sub1WindowController: NSWindowController?
    
    @objc func showMainWindow() {
        if let button = statusItem.button {
            // main window opened, so close it
            if(self.mainWindowPopover.isShown) {
                self.hideMainWindow(self)
            }
            //even minimazie, MyVariables.sub1WindowController?.showWindow(nil) still not nil
            else if (MyVariables.sub1WindowController?.showWindow(nil) == nil && MyVariables.openedBool == true && self.mainWindowPopover.isShown == false){
                print("==nil")
                MyVariables.sub1WindowController?.showWindow(nil)
            }
                
            // first open main window
            else if (MyVariables.sub1WindowController?.showWindow(nil) == nil && MyVariables.openedBool == false && self.mainWindowPopover.isShown == false){
                self.mainWindowPopover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
                eventMonitor?.start()
            }
                
            else if(MyVariables.sub1WindowController?.showWindow(nil) != nil && MyVariables.openedBool == true && self.mainWindowPopover.isShown == false){
                print(MyVariables.sub1WindowController?.showWindow(nil) ?? "warning")
                print(self.mainWindowPopover.isShown)
                
                self.mainWindowPopover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
                eventMonitor?.start()
                print("yyy")
                

            }
                
            else {
                MyVariables.sub1WindowController?.showWindow(nil)
            }
        }
    }
    
    func hideMainWindow(_ sender: AnyObject?) {
        self.mainWindowPopover.performClose(sender)
        eventMonitor?.stop()
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Screenbar")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    @IBAction func saveAction(_ sender: AnyObject?) {
        // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
        let context = persistentContainer.viewContext
        
        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing before saving")
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Customize this code block to include application-specific recovery steps.
                let nserror = error as NSError
                NSApplication.shared.presentError(nserror)
            }
        }
    }
    func windowWillReturnUndoManager(window: NSWindow) -> UndoManager? {
        return persistentContainer.viewContext.undoManager
    }
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        let context = persistentContainer.viewContext
        
        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing to terminate")
            return .terminateCancel
        }
        
        if !context.hasChanges {
            return .terminateNow
        }
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            
            let result = sender.presentError(nserror)
            if (result) {
                return .terminateCancel
            }
            
            let question = NSLocalizedString("Could not save changes while quitting. Quit anyway?", comment: "Quit without saves error question message")
            let info = NSLocalizedString("Quitting now will lose any changes you have made since the last successful save", comment: "Quit without saves error question info");
            let quitButton = NSLocalizedString("Quit anyway", comment: "Quit anyway button title")
            let cancelButton = NSLocalizedString("Cancel", comment: "Cancel button title")
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = info
            alert.addButton(withTitle: quitButton)
            alert.addButton(withTitle: cancelButton)
        }
        return .terminateNow
    }
    
    
}

