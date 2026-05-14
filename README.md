# 📡 NRF24L01 Wireless LED Controller (TX/RX)

![C](https://img.shields.io/badge/Language-C-blue)
![Embedded Systems](https://img.shields.io/badge/Domain-Embedded_Systems-orange)
![NRF24L01](https://img.shields.io/badge/Module-NRF24L01-brightgreen)
![PWM](https://img.shields.io/badge/Feature-PWM_Control-yellow)

This repository contains a modular embedded systems project that establishes a wireless control system using **NRF24L01** transceiver modules. The project is divided into two distinct nodes: a **Transmitter (TX)** and a **Receiver (RX)**. The TX node reads an analog value from a variable resistor, and the RX node uses this received data to dynamically control the brightness of an LED.

---

## 🎯 Project Objectives & Features
- **Two-Node Architecture:** Separate codebases for Transmitter (`tx`) and Receiver (`rx`).
- **Wireless Communication:** One-way data transmission using the NRF24L01 module with Enhanced ShockBurst (auto-ACK) for reliable delivery.
- **Data Acquisition (TX):** Reads analog voltage from a variable resistor (potentiometer) using an **$8$-bit ADC resolution**.
- **PWM Brightness Control (RX):** Maps the received $8$-bit payload ($0$ to $255$) to a PWM signal to smoothly adjust the brightness of an LED.

---

## ⚙️ Hardware Setup

### 1. Transmitter Node (TX)
- **Microcontroller**
- **NRF24L01 Transceiver:** Connected via SPI.
- **Variable Resistor (Potentiometer):** Wiper pin connected to the microcontroller's **ADC input channel**.

### 2. Receiver Node (RX)
- **Microcontroller**
- **NRF24L01 Transceiver:** Connected via SPI.
- **LED:** Connected to a **PWM-capable output pin** (with a suitable current-limiting resistor).

---

## 🧩 Software Architecture

The codebase is structured modularly. Below is the breakdown of the core functionalities for both nodes:

### 📡 Transmitter (`tx` directory)
1. **`adc` Module:** 
   - Configures the ADC pin in analog mode.
   - Sets the ADC resolution to **$8$-bits**.
   - Reads and returns the digital value of the potentiometer.
2. **`nrf24l01` Module (TX Mode):** 
   - Configures the RF module to transmit data and wait for ACKs (ShockBurst).
3. **`main.c` (TX):** 
   - Continuously reads the $8$-bit ADC value and passes it to the NRF module for transmission.

### 🎯 Receiver (`rx` directory)
1. **`pwm` Module:** 
   - Configures a hardware timer to generate a PWM signal.
   - Uses the received $8$-bit value to update the timer's Duty Cycle, scaling the LED brightness from $0\%$ to $100\%$.
2. **`nrf24l01` Module (RX Mode):** 
   - Listens on the designated RF channel.
   - Automatically sends ACKs back to the transmitter upon successful data reception.
3. **`main.c` (RX):** 
   - Polls or uses interrupts to check for new RF payloads.
   - Updates the PWM duty cycle register immediately after receiving the $8$-bit value.

---

## 🚀 Getting Started
1. **Wiring:** Ensure NRF24L01 modules are powered with exactly **$3.3V$** (do not use $5V$ for power, though data pins are usually $5V$-tolerant).
2. **Compile TX:** Navigate to the `tx` folder, compile the code, and flash it to the Transmitter microcontroller.
3. **Compile RX:** Navigate to the `rx` folder, compile the code, and flash it to the Receiver microcontroller.
4. **Test:** Turn the potentiometer on the TX board and observe the LED brightness changing smoothly on the RX board.
