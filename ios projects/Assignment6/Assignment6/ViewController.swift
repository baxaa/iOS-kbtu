import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var softEggButton: UIButton!
    @IBOutlet weak var mediumEggButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var hardEggButton: UIButton!

    @IBOutlet weak var Image: UIImageView!
    var timer: Timer?
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer?

    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        progressBar.progress = 0.0
        timeLabel.text = "00:00"

        softEggButton.setImage(UIImage(named: "soft_egg"), for: .normal)
        mediumEggButton.setImage(UIImage(named: "medium_egg"), for: .normal)
        hardEggButton.setImage(UIImage(named: "hard_egg"), for: .normal)

        [softEggButton, mediumEggButton, hardEggButton].forEach { button in
            button?.layer.cornerRadius = 10
            button?.clipsToBounds = true
            button?.addTarget(self, action: #selector(eggButtonTapped(_:)), for: .touchUpInside)
        }
    }

    @objc func eggButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        
        let hardness: String
        let imageName: String
        switch sender {
        case softEggButton:
            hardness = "Soft"
            imageName = "soft_egg"
        case mediumEggButton:
            hardness = "Medium"
            imageName = "medium_egg"
        case hardEggButton:
            hardness = "Hard"
            imageName = "hard_egg"
        default:
            return
        }
        
        Image.image = UIImage(named: imageName)
        totalTime = eggTimes[hardness] ?? 0
        secondsPassed = 0
        progressBar.progress = 0.0
        timeLabel.text = timeString(from: totalTime)

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateTimer()
        }

        // Visual feedback
        UIView.animate(withDuration: 0.1, animations: {
            sender.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.alpha = 1.0
            }
        }
    }

    func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            timeLabel.text = timeString(from: totalTime - secondsPassed)
        } else {
            timer?.invalidate()
            timeLabel.text = "Done!"
            playAlarmSound()
        }
    }

    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func playAlarmSound() {
        guard let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing alarm sound: \(error.localizedDescription)")
        }
    }
}
