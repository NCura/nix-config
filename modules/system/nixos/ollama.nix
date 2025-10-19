{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    rocmOverrideGfx = "11.0.0";
    loadModels = [
      "llama3.1:70b"
      "llama3.1"
    ];
  };
}
