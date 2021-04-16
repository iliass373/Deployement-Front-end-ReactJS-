job('ReactJS') {
    scm {
        git('git://github.com/iliass373/Deployement-Front-end-ReactJS-.git') {  node -> // is hudson.plugins.git.GitSCM
            node / gitConfigName('DSL User')
            node / gitConfigEmail('iliass.bendidia@um5r.ac.ma')
        }
    }
    triggers {
        scm('H/5 * * * *')
    }
    wrappers {
        nodejs('nodejs')
    }
    steps {
        shell("npm install")
    }
}