const { Client, GatewayIntentBits } = require('discord.js');

const client = new Client({ 
    intents: [GatewayIntentBits.Guilds, GatewayIntentBits.GuildMessages, GatewayIntentBits.MessageContent] 
});

const TOKEN = 'MTE0MDg5MjU1MDI5NTcyMDAzNg.GvJAak.8GT4udu11zLRlUPJzDooegAxn7EqZIG8vspfrY'; 

client.once('ready', () => {
    console.log('Bot is online!');
});
flag = false
client.on('messageCreate', message => {
    console.log(message.content)
    if (message.content === 'dad') {
        console.log(flag)
        message.channel.send('hello');
        flag = !flag
    }
});

client.login(TOKEN);
