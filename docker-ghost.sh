#!/bin/bash

echo "======================================"
echo "   GHOST TOOLKIT - DOCKER SETUP      "
echo "======================================"
echo ""

IMAGE_NAME="ghost-toolkit"
CONTAINER_NAME="ghost-toolkit"

case "${1:-build}" in
    build)
        echo "[*] Building Docker image..."
        docker build -t $IMAGE_NAME .
        echo ""
        echo "[+] Image built successfully!"
        ;;
    run)
        echo "[*] Running Ghost Toolkit container..."
        docker run --rm -it \
            --name $CONTAINER_NAME \
            --network host \
            --cap-add NET_ADMIN \
            --cap-add NET_RAW \
            -v $(pwd)/scans:/scans \
            -v $(pwd)/payloads:/payloads \
            $IMAGE_NAME
        ;;
    start)
        echo "[*] Starting Ghost Toolkit..."
        docker-compose up -d
        echo ""
        echo "[+] Ghost Toolkit is running!"
        echo "    Launcher: docker exec -it ghost-toolkit ./ghost_launcher.sh"
        echo "    Web UI:   http://localhost:8080"
        ;;
    stop)
        echo "[*] Stopping Ghost Toolkit..."
        docker-compose down
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    shell)
        docker exec -it ghost-toolkit /bin/bash
        ;;
    logs)
        docker logs -f ghost-toolkit
        ;;
    clean)
        echo "[*] Cleaning up..."
        docker-compose down -v
        docker rmi $IMAGE_NAME
        echo "[+] Cleanup complete!"
        ;;
    *)
        echo "Usage: $0 {build|run|start|stop|restart|shell|logs|clean}"
        echo ""
        echo "Commands:"
        echo "  build   - Build the Docker image"
        echo "  run     - Run container interactively"
        echo "  start   - Start services with docker-compose"
        echo "  stop    - Stop running services"
        echo "  restart - Restart services"
        echo "  shell   - Get shell access to container"
        echo "  logs    - View container logs"
        echo "  clean   - Remove containers and image"
        ;;
esac
