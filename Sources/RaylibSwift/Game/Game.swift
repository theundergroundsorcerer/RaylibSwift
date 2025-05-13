/// Game protocol for runnable Game apps
public protocol Game: AnyObject {
    /// Code that loads the necessary game data that could not be loaded during initialization 
    /// goes here
    func loadData() throws(LoadingError)

    /// Creates game window and runs sets the neccessary raylib configuration flags
    func beginGame()

    /// runs the game loop at target fps
    func loop(targetFPS: Int32)

    /// handles keyboard, gamepad, mouse and touch input here
    /// In general - the interactions with input devices should be done here
    func handleInput()

    /// update the game state
    func update()

    /// Draws the game world
    func draw()

    /// cleans up the game and closes the window
    func close()

    /// creates and runs single instance of game
    static func run()

    /// creates an instance of game with default settings
    static func make() -> Self
}

/// default implementations of some game function
extension Game {
    public func loadData() throws(LoadingError) {}

    public func handleInput() {}

    public func loop(targetFPS: Int32) {
        Time.setFps(targetFPS)
        while !Window.shouldClose {
            handleInput()
            update()
            draw()
        }
    }
    
    public func close() {
        if Window.shouldClose { Window.close() }
    }

    public static func run() {
        let game = make()
        do {
            try game.loadData()
            game.beginGame()
            game.loop(targetFPS: 60)
            game.close()
        } catch let loadingError {
            print(loadingError)
            fatalError("Could not load game data")
        }
    }
}
