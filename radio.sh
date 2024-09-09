#!/bin/bash

# Define the radio stream URLs
gaucha_url="https://liverdgaupoa.rbsdirect.com.br/primary/gaucha_rbs.sdp/chunklist_3ceb8daa-4ccd-49b9-86d7-8e50e49fb6fa.m3u8"
atlantida_url="https://liverdatlpoa.rbsdirect.com.br/primary/atl_poa.sdp/chunklist_b1ef86ef-9aa5-4119-af16-824e25e58a99.m3u8"
grenal_url="https://grenal.audiostream.com.br:20000/aac"
band_url="https://player-radiobandeirantes-poa.stream.uol.com.br/live/radiobandeirantes-poa.m3u8"
cultura_url="http://streaming.procergs.com.br:1935/fmcultura/sfmcultura/playlist.m3u8"
cdpt="https://liverd102fm.rbsdirect.com.br/primary/ita_poa.sdp/chunklist_75db69b7-6dc5-4a08-bf23-65a3239eb101.m3u8"

# Function to play a radio stream
play_radio() {
    local alias_name="$1"
    local stream_url="$2"
    echo "Playing $alias_name..."
    mpv --no-video "$stream_url" --profile=low-latency --untimed
}

# Main menu
while true; do
    echo "Select a radio station:"
    echo "  1. Gaúcha"
    echo "  2. Atlântida"
    echo "  3. Grenal"
    echo "  4. Band"
    echo "  5. Cultura"
    echo "  6. 102.3"
    echo "  q. Quit"

    read -p "Enter your choice: " choice

    case "$choice" in
        1) play_radio "Gaúcha" "$gaucha_url" ;;
        2) play_radio "Atlântida" "$atlantida_url" ;;
        3) play_radio "Grenal" "$grenal_url" ;;
        4) play_radio "Band" "$band_url" ;;
        5) play_radio "Cultura" "$cultura_url" ;;
	6) play_radio "102.3" "$cdpt" ;;
        q) echo "Goodbye!"
           exit ;;
        *) echo "Invalid choice. Please select a valid option." ;;
    esac
done

