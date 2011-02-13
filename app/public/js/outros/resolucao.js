if(screen.height<768 || screen.width<1024){
    var c = confirm('Esta aplicacao apresenta problemas de compatibilidade com resolucoes inferiores a 1024x768! \nDeseja continuar assim mesmo?')
    if(!c){
        window.location = '';
    }
}