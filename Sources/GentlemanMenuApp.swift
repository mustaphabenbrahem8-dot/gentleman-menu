import SwiftUI

@main
struct GentlemanMenuApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var unlocked = false
    @State private var key = ""

    var body: some View {
        Group {
            if unlocked {
                MenuView()
            } else {
                LoginView(key: $key) {
                    if key == "GENTLEMAN-2026" {
                        unlocked = true
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct LoginView: View {
    @Binding var key: String
    let unlock: () -> Void

    var body: some View {
        VStack(spacing: 22) {
            Text("♛")
                .font(.system(size: 60))

            Text("GENTLEMAN MENU")
                .font(.largeTitle.bold())
                .foregroundStyle(.purple)

            Text("Accesso al menu")

            SecureField("Inserisci la chiave", text: $key)
                .textFieldStyle(.roundedBorder)

            Button("SBLOCCA MENU", action: unlock)
                .buttonStyle(.borderedProminent)

            Text("v2.0 DEMO / TEST")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(30)
    }
}

struct MenuView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }

            PlayerView()
                .tabItem { Label("Player", systemImage: "person") }

            VisualView()
                .tabItem { Label("Visual", systemImage: "eye") }

            VehicleView()
                .tabItem { Label("Vehicle", systemImage: "car") }

            WorldView()
                .tabItem { Label("World", systemImage: "globe") }

            CasinoView()
                .tabItem { Label("Casino", systemImage: "dice") }

            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
        .tint(.purple)
    }
}

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("♛ GENTLEMAN MENU")
                    .font(.title.bold())
                    .foregroundStyle(.purple)

                Text("Sistema demo online")
                Text("READY")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.purple)

                Text("Interfaccia indipendente dal gioco.")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

struct PlayerView: View {
    @State private var name = "Gentleman"
    @State private var level = 1

    var body: some View {
        NavigationStack {
            Form {
                Section("👤 PLAYER") {
                    TextField("Nome demo", text: $name)

                    Picker("Livello", selection: $level) {
                        ForEach([1, 10, 25, 50, 100], id: \.self) {
                            Text("Livello \($0)").tag($0)
                        }
                    }
                }

                Section("📊 STATS") {
                    LabeledContent("Nome", value: name)
                    LabeledContent("Livello", value: "\(level)")
                    LabeledContent("Salute", value: "100%")
                    LabeledContent("Energia", value: "100%")
                    LabeledContent("XP", value: "0")
                }
            }
            .navigationTitle("Player")
        }
    }
}

struct VisualView: View {
    @State private var boxes = false
    @State private var names = false
    @State private var health = false
    @State private var distance = false

    var body: some View {
        NavigationStack {
            Form {
                Section("👁 VISUAL DEMO") {
                    Toggle("Boxes", isOn: $boxes)
                    Toggle("Names", isOn: $names)
                    Toggle("Health", isOn: $health)
                    Toggle("Distance", isOn: $distance)
                }

                Section {
                    Text("Le opzioni sono solo una simulazione dell'interfaccia.")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Visual")
        }
    }
}

struct VehicleView: View {
    @State private var vehicle = "Sport Car"

    let vehicles = ["Sport Car", "Sedan", "SUV", "Motorbike"]

    var body: some View {
        NavigationStack {
            Form {
                Section("🚗 VEHICLE DEMO") {
                    Picker("Veicolo", selection: $vehicle) {
                        ForEach(vehicles, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("📊 TELEMETRIA") {
                    LabeledContent("Velocità", value: "120 km/h")
                    LabeledContent("RPM", value: "3200")
                    LabeledContent("Carburante", value: "78%")
                    LabeledContent("Salute", value: "100%")
                }
            }
            .navigationTitle("Vehicle")
        }
    }
}

struct WorldView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section("🌍 WORLD DEBUG") {
                    LabeledContent("X", value: "125.42")
                    LabeledContent("Y", value: "-87.11")
                    LabeledContent("Z", value: "32.50")
                }

                Section("🎥 CAMERA") {
                    Text("FREE")
                }
            }
            .navigationTitle("World")
        }
    }
}

struct CasinoView: View {
    @State private var balance = 1_000_000
    @State private var result = "Risultato: —"

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("🎰 CASINO SIMULATOR")
                    .font(.title2.bold())

                Text("$\(balance)")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.purple)

                Button("GIRA") {
                    let bet = 1_000
                    if Bool.random() {
                        balance += bet
                        result = "Vittoria demo: +\(bet) $"
                    } else {
                        balance -= bet
                        result = "Perdita demo: -\(bet) $"
                    }
                }
                .buttonStyle(.borderedProminent)

                Text(result)
            }
            .padding()
            .navigationTitle("Casino")
        }
    }
}

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section("⚙️ SETTINGS") {
                    Text("GENTLEMAN MENU v2.0")
                    Text("DEMO / TEST")
                }

                Section("🔐 ACCESSO") {
                    Text("Chiave demo: GENTLEMAN-2026")
                }
            }
            .navigationTitle("Settings")
        }
    }
}
