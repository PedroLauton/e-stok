
document.addEventListener("DOMContentLoaded", () => {
    const sections = document.querySelectorAll('.section-animation');
  
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible'); 
          // Não desative a observação para reativar as animações
        } else {
          entry.target.classList.remove('visible'); // Remove a classe quando sair do viewport
        }
      });
    }, {
      threshold: 0.2 // Ativa quando 20% da seção está visível
    });
  
    sections.forEach(section => observer.observe(section));
  });