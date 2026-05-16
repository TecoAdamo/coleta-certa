# ColetaCerta ♻️
Aplicativo iOS desenvolvido com UIKit + ViewCode para ajudar usuários a consultarem os horários de coleta de lixo da sua região de forma simples, rápida e intuitiva.

<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-15 at 23 46 48" src="https://github.com/user-attachments/assets/3e7c1b36-d5bc-4500-bb5b-d564919b8564" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-15 at 23 46 41" src="https://github.com/user-attachments/assets/58646eff-2382-42be-ae3c-c2346d99d7ff" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-15 at 23 46 21" src="https://github.com/user-attachments/assets/af5b220f-dfb6-4e95-9d57-a16b9ea14578" />


# 📱 Sobre o projeto
O ColetaCerta foi criado com o objetivo de facilitar o acesso às informações de coleta seletiva e coleta orgânica em diferentes bairros e regiões.
O aplicativo utiliza um fluxo de onboarding para identificar a localização do usuário e, posteriormente, exibir os dias e horários corretos de coleta.
O projeto está sendo desenvolvido com foco em:
arquitetura organizada
componentização
reutilização de UI
escalabilidade
boas práticas no UIKit

# ✨ Features
Splash Screen
Onboarding
Cadastro de endereço
Consulta de horários de coleta
Componentes reutilizáveis
Inputs customizados
Botões customizados
Estrutura modular
Layout 100% ViewCode

# 🛠️ Tecnologias utilizadas
Swift
UIKit
ViewCode
Auto Layout
JSON local
MVC
Componentização de UI

# 📂 Estrutura do projeto
```
ColetaCerta
│
├── Core
│   ├── Components
│   ├── Models
│   ├── Services
│   └── Colors
│
├── Features
│   ├── Splash
│   ├── Onboarding
│   ├── Address
│   └── Home
│
└── Resources
```
# 🧩 Componentes reutilizáveis
O projeto possui componentes reutilizáveis para facilitar manutenção e escalabilidade:
CustomButton
Botão reutilizável com estilos configuráveis.
CustomInput
Input reutilizável com:
título
placeholder
estilos
tipos de teclado
validação futura

# ▶️ Como executar
```
git clone <repo-url>
```
Abra o projeto no Xcode:
```
open ColetaCerta.xcodeproj
```
