import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    let notes = ["C", "D", "E", "F", "G", "A", "B"]
    let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .systemPink]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupXylophoneButtons()
    }
    
    func setupXylophoneButtons() {
        let buttonHeight = view.frame.height / CGFloat(notes.count)
        
        for (index, note) in notes.enumerated() {
            let button = UIButton()
            button.backgroundColor = colors[index]
            button.setTitle(note, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            view.addSubview(button)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.leftAnchor.constraint(equalTo: view.leftAnchor),
                button.rightAnchor.constraint(equalTo: view.rightAnchor),
                button.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(index) * buttonHeight),
                button.heightAnchor.constraint(equalToConstant: buttonHeight)
            ])
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let note = sender.titleLabel?.text else { return }
        playSound(note: note)
        
        // Visual feedback
        UIView.animate(withDuration: 0.1, animations: {
            sender.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.alpha = 1.0
            }
        }
    }
    
    func playSound(note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "mp3") else { print("Could not find file: \(note).mp3")
            return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
