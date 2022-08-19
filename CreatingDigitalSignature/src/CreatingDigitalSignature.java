import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class CreatingDigitalSignature extends JFrame {
	private Image img = Toolkit.getDefaultToolkit().getImage("images/background.png");
	private JLabel lblKey, lblHashCode, lblSignature, lblHD;
	private JPanel contentPane;
	private JTextArea textAreaPrivateKey, textHashCode, textSignature;
	private JButton button, button2;

	public CreatingDigitalSignature() throws IOException {

		this.setContentPane(new JPanel() {
			@Override
			public void paintComponent(Graphics g) {
				super.paintComponent(g);
				g.drawImage(img, 0, 0, this);
			}
		});
		setLayout(null);
		// Code View
		ImageIcon imgicon = new ImageIcon("images/lock.png");
		setIconImage(imgicon.getImage());
		setBounds(100, 100, 909, 249);

		this.lblKey = new JLabel("Private Key : ");
		this.lblKey.setBounds(30, 50, 230, 35);
		lblKey.setForeground(Color.WHITE);
		lblKey.setFont(new Font("Serif", Font.BOLD, 30));
		this.add(lblKey);

		this.textAreaPrivateKey = new JTextArea();
		this.textAreaPrivateKey.setForeground(Color.DARK_GRAY);
		this.textAreaPrivateKey.setFont(new Font("Serif", Font.BOLD, 15));
		JScrollPane pane1 = new JScrollPane();
		textAreaPrivateKey.setLineWrap(true);
		pane1.setViewportView(textAreaPrivateKey);
		pane1.setBounds(200, 50, 350, 80);
		this.add(pane1);

		this.lblHashCode = new JLabel("Mã Hash: ");
		this.lblHashCode.setBounds(30, 200, 230, 35);
		lblHashCode.setForeground(Color.WHITE);
		lblHashCode.setFont(new Font("Serif", Font.BOLD, 30));
		this.add(lblHashCode);

		this.textHashCode = new JTextArea();
		this.textHashCode.setForeground(Color.DARK_GRAY);
		this.textHashCode.setFont(new Font("Serif", Font.BOLD, 15));
		textHashCode.setLineWrap(true);
		JScrollPane pane2 = new JScrollPane();
		pane2.setViewportView(textHashCode);
		pane2.setBounds(200, 200, 350, 80);
		this.add(pane2);

		this.button = new JButton("Lấy chữ ký!");
		this.button.setBounds(280, 300, 180, 30);
		this.button.setForeground(Color.DARK_GRAY);
		this.button.setFont(new Font("Serif", Font.BOLD, 15));
		this.add(button);

		this.lblSignature = new JLabel("Chữ ký: ");
		this.lblSignature.setBounds(30, 350, 230, 35);
		lblSignature.setForeground(Color.WHITE);
		lblSignature.setFont(new Font("Serif", Font.BOLD, 30));
		this.add(lblSignature);

		this.textSignature = new JTextArea();
		this.textSignature.setForeground(Color.black);
		this.textSignature.setFont(new Font("Serif", Font.BOLD, 15));
		textSignature.setLineWrap(true);
		JScrollPane pane3 = new JScrollPane();
		pane3.setViewportView(textSignature);
		pane3.setBounds(200, 350, 350, 80);
		this.add(pane3);
		textSignature.setEditable(false);

		this.button2 = new JButton("Sao chép chữ ký!");
		this.button2.setBounds(280, 450, 180, 30);
		this.button2.setForeground(Color.DARK_GRAY);
		this.button2.setFont(new Font("Serif", Font.BOLD, 15));
		this.add(button2);
		
		this.lblHD = new JLabel("(*) Điền khóa Private và Mã Hash lấy từ trang web, sau đó lấy chữ ký xác nhận.");
		this.lblHD.setBounds(30, 500, 700, 35);
		lblHD.setForeground(Color.WHITE);
		lblHD.setFont(new Font("Serif", Font.BOLD, 15));
		this.add(lblHD);

		// Xử lý sự kiện
		this.button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (textAreaPrivateKey.getText().equals("")||textHashCode.getText().equals("")) {
					JFrame frame = new JFrame("JOptionPane showMessageDialog example");
					JOptionPane.showMessageDialog(frame, "Chưa nhập đủ thông tin", "Error",
							JOptionPane.INFORMATION_MESSAGE);
				} else {
					try {
						String msg = textHashCode.getText();
						PrivateKey privKey = getPrivateKey(textAreaPrivateKey.getText().toString());
						// Creating a Signature object
						Signature sign = Signature.getInstance("SHA256withRSA");
						sign.initSign(privKey);
						byte[] bytes = msg.getBytes();

						// Adding data to the signature
						sign.update(bytes);

						// Calculating the signature
						byte[] signature = sign.sign();
						textSignature.setText(Base64.getEncoder().encodeToString(signature));

					} catch (Exception e1) {
						JFrame frame = new JFrame("JOptionPane showMessageDialog example");
						JOptionPane.showMessageDialog(frame, "Mã Private Key không đúng", "Err Private Key",
								JOptionPane.INFORMATION_MESSAGE);
						e1.printStackTrace();
					}
				}
			}
		});
		
		// Xử lý sự kiện
				this.button2.addActionListener(new ActionListener() {
					public void actionPerformed(ActionEvent e) {
						String myString = textSignature.getText();
						StringSelection stringSelection = new StringSelection(myString);
						Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
						clipboard.setContents(stringSelection, null);
						
					}
				});
	}

	public static PrivateKey getPrivateKey(String base64PrivateKey) {
		PrivateKey privateKey = null;
		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(base64PrivateKey.getBytes()));
		KeyFactory keyFactory = null;
		try {
			keyFactory = KeyFactory.getInstance("RSA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		try {
			privateKey = keyFactory.generatePrivate(keySpec);
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return privateKey;
	}

	public static void main(String[] args) throws Exception {
		CreatingDigitalSignature jf = new CreatingDigitalSignature();
		jf.setTitle("Creating Digital Signature");
		jf.setDefaultCloseOperation(3);
		jf.setSize(900, 600);
		jf.setVisible(true);
	}
}